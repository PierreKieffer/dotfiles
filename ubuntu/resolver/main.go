package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

func main() {
	systemdConfFile := "/run/systemd/resolve/resolv.conf"

	systemdConfData := ReadFile(systemdConfFile)

	nameserver := ExtractNameserver(systemdConfData)

	targetConfFile := "/etc/resolv.conf"

	UpdateFile(targetConfFile, targetConfFile, nameserver)

}

func ReadFile(filePath string) []string {

	fileBytes, err := ioutil.ReadFile(filePath)

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	inputSlice := strings.Split(string(fileBytes), "\n")

	return inputSlice
}

func UpdateFile(filePath string, outputFile string, nameserver string) {

	fileBytes, err := ioutil.ReadFile(filePath)

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	lines := strings.Split(string(fileBytes), "\n")

	for i, line := range lines {
		if strings.Contains(line, "nameserver") {
			lines[i] = nameserver
		}
	}
	output := strings.Join(lines, "\n")
	err = ioutil.WriteFile(outputFile, []byte(output), 0644)
	if err != nil {
		log.Fatalln(err)
	}
}

func ExtractNameserver(systemdConfData []string) string {

	var nameserver string
	for _, chunck := range systemdConfData {
		subChunck := strings.Split(chunck, " ")
		for _, sc := range subChunck {
			if sc == "nameserver" {
				nameserver = chunck
			}
		}

	}
	return nameserver
}

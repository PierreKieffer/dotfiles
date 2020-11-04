
### DNS set up ubuntu 18.04 
https://www.blog-libre.org/2017/04/20/essuyer-les-platres-dns-sur-ubuntu/

On peut constater que /etc/resolv.conf est en réalité un lien symbolique pointant vers /run/resolvconf/resolv.conf. On va supprimer ce lien symbolique puis en tirer un autre vers /run/systemd/resolve/resolv.conf qui est un fichier maintenu à jour par systemd-resolved pour compatibilité avec les programmes traditionnels Linux.

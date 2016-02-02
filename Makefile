.Phony: all list box add

all: packer_virtualbox-iso_virtualbox.box

packer_virtualbox-iso_virtualbox.box: template.json
	-rm packer_virtualbox-iso_virtualbox.box
	packer build template.json

list:
	@-ls *.box

boxadd:
	vagrant box add --name ol7 --provider virtualbox --force packer_virtualbox-iso_virtualbox.box

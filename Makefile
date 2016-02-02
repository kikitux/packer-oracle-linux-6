.Phony: all list

all: packer_virtualbox-iso_virtualbox.box

packer_virtualbox-iso_virtualbox.box: template.json
	-rm packer_virtualbox-iso_virtualbox.box
	packer build template.json

list:
	@-ls *.box

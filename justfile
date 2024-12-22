defaultTarget := 'main.typ'

sioyek target=defaultTarget:
	#!/usr/bin/env bash
	if [ ! -f "{{ without_extension(target) }}.pdf" ]; then
		typst compile "{{ target }}"
	fi
	sioyek "{{ without_extension(target) }}.pdf" &
	typst watch "{{ target }}"

skim target=defaultTarget:
	#!/usr/bin/env bash
	if [ ! -f "{{ without_extension(target) }}.pdf" ]; then
		typst compile "{{ target }}"
	fi
	open -a /Applications/Skim.app "{{ without_extension(target) }}.pdf"
	typst watch "{{ target }}"

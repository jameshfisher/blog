all:
	xsltproc src/margins.xml > margins.html
	xsltproc src/thatcher-effect.xml > thatcher-effect.html

all: nicoll-pvc-access-plug-opener.stl images/render.png

nicoll-pvc-access-plug-opener.stl: nicoll-pvc-access-plug-opener.scad
	openscad -o $@ $^

images/render.png: nicoll-pvc-access-plug-opener.scad
	mkdir -p images/
	openscad -o $@ $^

clean:
	rm -f nicoll-pvc-access-plug-opener.scad images/render.png
	if [ -d images ] ; then rmdir --ignore-fail-on-non-empty images/ ; fi

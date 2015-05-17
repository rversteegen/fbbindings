#!/bin/bash

versions="216 217 218 219 220 221 222 223 224 225"

echo "bfd:" > bfd.mk
echo >> bfd.mk
for v in $versions; do
	echo "	./get.sh \$(BINUTILS_$v) \$(BINUTILS_$v).tar.bz2 http://ftp.gnu.org/gnu/binutils/\$(BINUTILS_$v).tar.bz2" >> bfd.mk
done

echo >> bfd.mk
for v in $versions; do
	echo "	sed \$(BINUTILS_SED_32) < extracted/\$(BINUTILS_$v)/bfd/bfd-in2.h > extracted/\$(BINUTILS_$v)/bfd/bfd-in3-32.h" >> bfd.mk
done

echo >> bfd.mk
for v in $versions; do
	echo "	sed \$(BINUTILS_SED_64) < extracted/\$(BINUTILS_$v)/bfd/bfd-in2.h > extracted/\$(BINUTILS_$v)/bfd/bfd-in3-64.h" >> bfd.mk
done

echo >> bfd.mk
for v in $versions; do
	echo "	sed \$(BINUTILS_SED_DJGPP) < extracted/\$(BINUTILS_$v)/bfd/bfd-in2.h > extracted/\$(BINUTILS_$v)/bfd/bfd-in3-djgpp.h" >> bfd.mk
done

lastversion=`for i in $versions; do echo $i; done | tail -1`

cat >> bfd.mk <<EOF

	\$(GETCOMMENT) -2 extracted/\$(BINUTILS_$lastversion)/bfd/bfd-in2.h > bfd-$lastversion.tmp

	\$(FBFROG) bfd.fbfrog \\
		-declareversions __BFD_VER__ 216 217 218 219 220 221 222 223 224 225 \\
		-select __BFD_VER__ \\
EOF

mergedtitle=""
for v in $versions; do
	cat >> bfd.mk <<EOF
		-case $v \\
			-incdir extracted/\$(BINUTILS_$v)/include \\
			-ifdef __FB_DOS__ \\
				extracted/\$(BINUTILS_$v)/bfd/bfd-in3-djgpp.h \\
			-else \\
				-ifdef __FB_64BIT__ \\
					extracted/\$(BINUTILS_$v)/bfd/bfd-in3-64.h \\
				-else \\
					extracted/\$(BINUTILS_$v)/bfd/bfd-in3-32.h \\
				-endif \\
			-endif \\
EOF

	thistitle="\$(BINUTILS_$v)"
	if [ -z "$mergedtitle" ]; then
		mergedtitle="$thistitle"
	else
		mergedtitle="$mergedtitle, $thistitle"
	fi
done

cat >> bfd.mk <<EOF
		-endselect \\
		-emit '*/bfd/bfd-*.h' inc/bfd.bi \\
		-title "$mergedtitle" bfd-$lastversion.tmp fbteam.txt inc/bfd.bi \\
		-inclib bfd -inclib iberty \\
		-ifdef __FB_WIN32__ -inclib intl -endif \\
		-ifdef __FB_DOS__   -inclib intl -endif

	rm *.tmp
EOF

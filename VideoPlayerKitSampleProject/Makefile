# CURDIR preferable to PWD in Makefile's, as it handles gnumake's --directory
# recursion correctly
BUILDDIR=${CURDIR}/build
GEM_CACHE=${CURDIR}/cache
POD_CACHE=${CURDIR}/Pods
DISTRIBUTION_IDENTITY=iPhone Distribution: FOX Interactive Media

PLISTBUDDY=/usr/libexec/PlistBuddy
INFO_PLIST=VideoPlayerSample/VideoPlayerSample-Info.plist
VERSION_SHORT=$(shell git describe --abbrev=0)
VERSION_LONG=$(shell git describe --long)

ZIP=/usr/bin/zip
CURL=/usr/bin/curl

LAST_TAG=$(shell git for-each-ref refs/tags --sort=-authordate --format='%(refname)' --count=2 | tail -n1)
NOTES=${BUILDDIR}/notes

build-debug: setup xcodebuild-debug

xcodebuild-debug: setup
	xcodebuild -workspace VideoPlayerSample.xcworkspace -sdk iphonesimulator \
	    -scheme VideoPlayerSample -configuration Debug \
	    clean build

setup:
	bundle install --path=${GEM_CACHE}
	bundle exec pod install

clean:
	${RM} -r ${BUILDDIR}
	${RM} -r ${GEM_CACHE}
	${RM} -r ${POD_CACHE}

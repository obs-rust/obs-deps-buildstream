kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- (@): include/_private/fsdk-depends-type.yml
  filename: fsdk-depends-stacks/srt.bst

variables:
  cmake-local: >-
    -DENABLE_SHARED=ON
    -DENABLE_STATIC=OFF
    -DENABLE_APPS=OFF
    -DENABLE_LOGGING=OFF

public:
  bst:
    split-rules:
      extra:
        - "%{bindir}/srt-ffplay"

sources:
- kind: git_repo
  url: github:Haivision/srt.git
  track: v1.5.7
  ref: 899348d8318eb9a3c5a5b6ec43c4a1114288773a
- kind: patch
  path: patches/srt/0001-enable-proper-cmake-build-types.patch

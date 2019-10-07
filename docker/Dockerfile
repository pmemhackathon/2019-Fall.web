#
# dockerfile for pmemhackathon, fc30 based
#
# fc30's packages for:
#	ndctl are at 65 or higher
#	pmdk (core) are at 1.6 or higher
#	libpmemobj++ at 1.6 and libpmemkv needs 1.7, so we build it
#	memkind at 1.7.0 and we need 1.9.0, so we build it
#	valgrind with pmem support isn't available, so we build it
#	libpmemkv isn't upstream yet, so build it (and bindings dependencies)

FROM fedora:30

LABEL maintainer="andy.rudoff@intel.com"

RUN dnf update -y && dnf install -y\
	asciidoc\
	asciidoctor\
	autoconf\
	automake\
	bash-completion\
	bc\
	bind-utils\
	binutils\
	clang\
	cmake\
	daxctl-devel\
	doxygen\
	emacs\
	file\
	findutils\
	fuse\
	fuse-devel\
	gcc\
	gcc-c++\
	gdb\
	git-all\
	glib2-devel\
	golang\
	gtest-devel\
	hub\
	json-c-devel\
	keyutils-libs-devel\
	kmod-devel\
	lbzip2\
	libpmemblk-devel\
	libpmem-devel\
	libpmemlog-devel\
	libpmemobj-devel\
	libpmempool-devel\
	librpmem-devel\
	libtool\
	libudev-devel\
	libunwind-devel\
	libuuid-devel\
	libuv-devel\
	make\
	man\
	nano\
	ncurses-devel\
	ndctl-devel\
	numactl-devel\
	java-11-openjdk\
	openssh-server\
	pandoc\
	passwd\
	perl-Text-Diff\
	pkgconfig\
	pmempool\
	rapidjson-devel\
	rpm-build\
	rpm-build-libs\
	rpmdevtools\
	rsync\
	ruby-devel\
	strace\
	tar\
	tbb-devel\
	unzip\
	vim-enhanced\
	wget\
	which\
	xmlto

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -

RUN dnf install -y nodejs

RUN dnf debuginfo-install -y glibc

RUN dnf clean all

COPY pmemkv-ruby.sh pmemobj-cpp.sh memkind.sh pmemkv.sh valgrind.sh tz.sh /

RUN /pmemkv-ruby.sh
RUN /pmemobj-cpp.sh
RUN /memkind.sh
RUN /pmemkv.sh
RUN /valgrind.sh
RUN /tz.sh

RUN rm /pmemkv-ruby.sh /pmemobj-cpp.sh /memkind.sh /pmemkv.sh /valgrind.sh /tz.sh

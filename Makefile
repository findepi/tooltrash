all:
	@ echo "You should consider reviewing other exisiting targets" >&2
	@ echo "*before* and *instead of* running \`make all -- this makes" >&2
	@ echo "no sense." >&2
	@ false

postupdate:

everything: clean commit sync

commit:
	git update-index -q --refresh
	if ! git diff-index --quiet --cached HEAD --ignore-submodules -- || \
	    ! git diff-files --quiet --ignore-submodules; then \
		git commit -am "autorecord `date "+%Y-%m-%d %H-%M"` `whoami`@`hostname`"; \
	fi

sync:
	git pull --rebase
	git push

clean:
	- find . -name \*~ -exec rm -vf '{}' +


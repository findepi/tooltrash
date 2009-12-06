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
#		git commit -am "autorecord `date "+%Y-%m-%d %H-%M"` `whoami`@`hostname`"; \
		echo '\nERROR: You have local uncommited changes.\n' >&2; false; \
	fi

sync:
	git pull --rebase
	branch_name=`git symbolic-ref HEAD | sed 's@^.*/@@'`; \
	    remote_name=`git config branch.$$branch_name.remote || echo origin`; \
	    git push $$remote_name :

clean:
	- find . -name \*~ -exec rm -vf '{}' +


all:
	@ echo "You should consider reviewing other exisiting targets" >&2
	@ echo "*before* and *instead of* running \`make all -- this makes" >&2
	@ echo "no sense." >&2
	@ false

everything: clean commit sync

commit:
	git commit -am "autorecord `date "+%Y-%m-%d %H-%M"` `whoami`@`hostname`"

sync:
	git pull --rebase
	git push

clean:
	- find . -name \*~ -exec rm -vf '{}' +


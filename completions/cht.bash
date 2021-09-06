_cht()
{
	# _init_completion || return

	if [ "${#COMP_WORDS[@]}" != "2" ]; then
		return
	fi

	## Strip : from $PATH
	IFS_old=$IFS;
	IFS=":";
	set -- $PATH;
	IFS=$IFS_old;

	## Find all files in $PATH
	# set -- $(find "$@" -type f -perm /u=x,g=x,o=x);
	# set -- $(find "$@" -type f);

	## Strip the path
	# for bin; do
	# 	bins="$bins ${bin##*/}"
	# done

	for dir; do
		bins="$bins $(cd "$dir" && compgen -f)"
	done

	COMPREPLY=($(compgen -W "$bins" "${COMP_WORDS[1]}"))
}

complete -F _cht cht

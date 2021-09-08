_comp_path()
{
	if [ "${#COMP_WORDS[@]}" != "2" ]; then
		return
	fi

	## Strip : from $PATH
	IFS_old=$IFS;
	IFS=":";
	set -- $PATH;
	IFS=$IFS_old;

	for dir; do
		bins="$bins $(cd "$dir" && compgen -f)"
	done

	COMPREPLY=($(compgen -W "$bins" "${COMP_WORDS[1]}"))
}

teaching-stats-2016-05.csv:
	curl -O http://software-carpentry.org/files/2016/05/teaching-stats-2016-05.csv

instructor_stats_survival.html: instructor_stats_survival.ipynb teaching-stats-2016-05.csv
	jupyter nbconvert $< --to html --execute --stdout > $@

.git-config:
	git config --local filter.dropoutput_jupyter.clean tools/drop_jupyter_output.sh
	git config --local filter.dropoutput_jupyter.smudge cat

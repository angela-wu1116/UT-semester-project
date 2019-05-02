all: MHT_companysizetype.txt

MHT_companySizeTransform.tsv: MHT_columns2.tsv
	cat MHT_columns2.tsv | sed 's/26-100/ss/'| sed 's/100-500/sm/' | sed 's/500- 1000/mm/'| sed 's/More than 1000/ml/' | sed 's/43470.00/ll/' | sed 's/43641.00/ll/' > $@

MHT_companysizetype.txt: MHT_companySizeTransform.tsv
	cat MHT_companysize.tsv | cut -f 2 | sort | uniq -c > $@

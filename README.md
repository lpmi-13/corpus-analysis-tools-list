# corpus-analysis-tools-list

![corpus-analysis.com](https://github.com/IngoKl/corpus-analysis-tools-list/blob/master/img/corpus-analysis.com.png)

This repository contains the code behind the list at [corpus-analysis.com](https://corpus-analysis.com). 

The site is written in old-school PHP and definitely not an example of great software engineering. That being said, you're more than welcome to optimize the code!

The **architecture** is a bit odd: 
The actual data is stored in a Google Sheets sheet. This sheet, which effectively works as a multiuser backend, is then being downloaded as a CSV file and processed.

If you want to **run your own version**, you simply need to change and rename `config.default.php` to `config.php`. Also, make sure to remove the analytics code and change the copyright/impressum.

## local development (non-docker)

`touch sheet.txt`

make sure this is in csv format with 5 values per row...ie:

**(The values are in this order:
Tool / Description / Categories	/ Platform / Pricing
...also, put a blank line at the top of the file. It gets stripped in the PHP code)**

```

tagger,this tags sentences with parts of speech, POS, web, free
parser,a basic parser to parse stuff,parsing,web,free
corpus,this is a list of words, corpus linguistics, linux/macOS/Windows, free
```

- then make sure you've added the name of the file into `config.php`:

```
$config_sheet_url = 'sheet.txt';
```

then run `php -S localhost:8000`


## local development (docker)

```
docker build -t local-php .
docker run --rm -p 8080:80 local-php
```

then just open `localhost:8080` in your browser

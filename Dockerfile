FROM php:7.1.8-apache

WORKDIR /srv/app
COPY . /srv/app

COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf


# also a bit hacky, just to get some data for the web UI
RUN echo '\n \
tagger,this tags sentences with parts of speech, POS, web, free, www.tagger.com\n \
parser,a basic parser to parse stuff,parsing,web,free, https://parseit.org\n \
corpus,this is a list of words, corpus linguistics, linux/macOS/Windows, free, https://getthatcorpus.com' \
>> sheet.txt

RUN sed "s/config_sheet_url = '';/config_sheet_url = 'sheet.txt';/g" config.default.php > config.php

# this is a hack until the structure of the sheet is more obvious
RUN sed -i 's/saveLocalData($sheet_data);/\/\/ saveLocalData($sheet_data);/g' table.php

RUN chown -R www-data:www-data /srv/app \
    && a2enmod rewrite

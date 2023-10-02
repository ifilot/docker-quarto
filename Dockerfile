FROM eddelbuettel/r2u:22.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends pandoc pandoc-citeproc curl gdebi-core 
RUN apt-get install -y python3-pip python3-pandas python3-plotly python3-numpy python3-scipy python3-matplotlib python3-jupyter-client python3-jupyter-core python3-nbclient python3-jinja2
RUN pip3 install ipykernel
RUN python3 -m ipykernel install
RUN rm -rf /var/lib/apt/lists/*
RUN install.r shiny jsonlite ggplot2 htmltools remotes renv knitr rmarkdown quarto
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN quarto install tinytex
RUN quarto add --no-prompt quarto-ext/include-code-files
RUN quarto add --no-prompt quarto-ext/fontawesome
RUN quarto install --no-prompt extension quarto-ext/fontawesome


layout 'layout/main.tpl', true,
        projects: projects,
				articles: articles,
        bodyContents: contents {

            div(class:"row"){
                div(class:"small-12 columns"){
                    section(class:"wrap"){
                        header{
                            h2("${content.title}")

                            time(datetime:"${content.date.format('yyyy-MM-dd')}"){
                                small("${content.date.format('dd.MM.yyyy')}")
                            }
                            hr()
                        }

                        yieldUnescaped content.body
                    }
                }
            }

        }


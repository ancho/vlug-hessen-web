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
                        div(class:"row"){
                            div(class:"small-12 columns"){
                                div(class:"project-meta"){
                                    dl{
                                        dt{
                                            strong("website")
                                        }
                                        dd{
                                            a(href:"${content.website}", "$content.website")
                                        }
                                        if ( content.project ) {
                                            dt{
                                                strong("Projekt URL")
                                            }
                                            dd{
                                                a(href:"${content.project}","$content.project")
                                            }
                                        }

                                        if ( content.git ) {
                                            dt{
                                                strong("git")
                                            }
                                            dd{
                                                code {
                                                    yieldUnescaped "git clone $content.git"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        div(class:"row"){
                            div(class:"small-12 columns"){
                               yieldUnescaped content.body
                            }
                        }
                    }
                }
            }

        }

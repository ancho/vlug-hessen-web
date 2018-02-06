div(class:"row"){

    div(class:"small-12 large-12 middle-12 small-text-center large-text-center middle-text-center columns"){
        div(class:"title-box" ){
            div(class:"title-content"){
                h1("${config.blog_title}")
                newLine()
                img(class: "vlug-logo", src: "img/logos/vlug-only.png", alt: "vlug Tux Logo")
                newLine()
                p("${config.blog_subtitle}")
                newLine()
                p(class:"title-contact"){
                    a(href:"https://gnusocial.de/group/vlughessen"){
                        i(class:"foundicon-chat"){}
                    }
                    a(href:"https://github.com/vlug-hessen/"){
                        i(class:"foundicon-github"){}
                    }
                }
            }
        }
        div(class:"sticky contain-to-grid"){
            nav(class:"top-bar", "data-topbar":"", role:"navigation"){
                ul(class:"title-area"){
                    li(class:"name"){}
                    comment 'Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone'
                    li(class:"toggle-topbar menu-icon"){
                        a(href:"#"){
                            span("Menu")
                        }
                    }
                }

                section(class:"top-bar-section"){
                    ul(class:"left"){
                        li{a(href:"${config.site_contextPath}index.html","Home")}
                        li{a(href:"${config.site_contextPath}blog/index.html","Blogs")}
                        li{a(href:"${config.site_contextPath}${config.archive_file}","Archive")}
												// dropdown - Projects
                        li(class:"has-dropdown"){
                            a(href:"${config.site_contextPath}projects.html",'Projects')
                            ul(class:"dropdown"){
                                projects.each { project ->
                                    li{
                                        a(href:"${config.site_contextPath}${project.uri}","${project.doctitle}")
                                    }
                                }
                            }
                        }

												// dropdown - articles
                        li(class:"has-dropdown"){
                            a(href:"${config.site_contextPath}articles.html",'Artikel')
                            ul(class:"dropdown"){
                                articles.each { article ->
                                    li{
                                        a(href:"${config.site_contextPath}${article.uri}","${article.doctitle}")
                                    }
                                }
                            }
                        }

                        li{a(href:"${config.site_contextPath}about.html","Über uns")}
                        li{
                            a(href:"${config.site_contextPath}${config.feed_file}","Subscribe")
                        }
                    }
                }
            }
        }
    }
}


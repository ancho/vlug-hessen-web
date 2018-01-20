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

table() {
	tr(){
			td("Name") td("${content.title}")
	}
	tr(){
			td("GPG-Key") td("${content.gpgkeyid}")
	}
	tr(){
			td("GPG-FP") td("${content.gpgfp}")
	}
	tr(){
			td("Homepage") td() {
              if (content.website) {
                a(href: content.website, content.website)
              }
            }
	}
	tr(){
			td("E-Mail") td("${content.mail.replace("@", " !at! ")}")
	}
	tr(){
			td("Linux-User seit") td("${content.linuxusersince}")
	}
	tr(){
			td("Distribution") td("${content.distribution}")
	}
	tr(){
			td("WindowManager") td("${content.windowmanager}")
	}
	tr(){
			td("Mail-Client") td("${content.mailclient}")
	}
	tr(){
			td("Sprache") td("${content.sprache}")
	}
}						

                        }

                        yieldUnescaped content.body
                    }
                }
            }

        }


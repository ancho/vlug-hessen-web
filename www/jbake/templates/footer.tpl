
div(class:"row"){
    div(class:"small-12 small-text-center"){
        p(class:"muted credit"){
		 yield "Generiert: ${new Date()} | " 
         yield "2017 - ${new Date().format("yyyy")} | "
         yield "Mixed with "
         a(href:"http://foundation.zurb.com/","Foundation v${config.foundation_version}")
         yield " | Baked with "
         a(href:"http://jbake.org","JBake ${version} | ")
		 a(href:"https://www.vlug-hessen.de/impressum.html", "Impressum")
        }
    }
}

model.put("projects",projects)
model.put("articles",articles)
layout 'layout/main.tpl', true,
        bodyContents: contents {
            model.put('post', content)
            include template: 'post-brick.tpl'
        }

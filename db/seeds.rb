# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Member.create(email: 'henrynf12@gmail.com', password: 'testtest')


article1 = {title: 'Abraham Lincoln', contents: "<h1>Here is a post</h1> <p>There are many great things that we can do with this post, and I am excited to show you all.</p> <p>For instance, <strong>here is some bold text</strong></p> <div style='background:#eee;border:1px solid #ccc;padding:5px 10px;'>Another Cool Thing is the fact I was able to put this as a block quote!</div> <hr /> <table border='1' cellpadding='1' cellspacing='1' style='width:500px'> <tbody> <tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> <tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> <tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> </tbody> </table> <ul> <li>Lets say that this is an article, how might I quote it? <a id='kjh' name='kjh'>Abraham</a> Lincoln was born on February 12, 1809&nbsp;<sup data-footnote-id='kjci1'><a href='#footnote-1' id='footnote-marker-1-1' rel='footnote'>[1]</a></sup></li> </ul> <blockquote> <p>And finally, here is a real block quote</p> </blockquote> <section class='footnotes'> <header> <h2>Footnotes</h2> </header> <ol> <li data-footnote-id='kjci1' id='footnote-1'><a href='#footnote-marker-1-1'>^</a> <cite>https://en.wikipedia.org/wiki/Abraham_Lincoln</cite></li> </ol> </section> <p>&nbsp;</p>", author: author}
article2 = {title: 'Grace Hopper', contents: "<h1>Here is a post</h1> <p>There are many great things that we can do with this post, and I am excited to show you all.</p> <p>For instance, <strong>here is some bold text</strong></p> <div style='background:#eee;border:1px solid #ccc;padding:5px 10px;'>Another Cool Thing is the fact I was able to put this as a block quote!</div> <hr /> <table border='1' cellpadding='1' cellspacing='1' style='width:500px'> <tbody> <tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> <tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> <tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> </tbody> </table> <ul> <li>Lets say that this is an article, how might I quote it? <a id='kjh' name='kjh'>Abraham</a> Lincoln was born on February 12, 1809&nbsp;<sup data-footnote-id='kjci1'><a href='#footnote-1' id='footnote-marker-1-1' rel='footnote'>[1]</a></sup></li> </ul> <blockquote> <p>And finally, here is a real block quote</p> </blockquote> <section class='footnotes'> <header> <h2>Footnotes</h2> </header> <ol> <li data-footnote-id='kjci1' id='footnote-1'><a href='#footnote-marker-1-1'>^</a> <cite>https://en.wikipedia.org/wiki/Abraham_Lincoln</cite></li> </ol> </section> <p>&nbsp;</p>", author: author}

Article.create!(article1)
Article.create!(article2)
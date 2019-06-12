function display_pubs(tag) {
    var out = '';
    var count = 0;
    for (const key in pubs) {
        if (count > 8) {
            break;
        }
        if (pubs.hasOwnProperty(key)) {
            const p = pubs[key];
            if (p.tags.includes(tag)) {
                out += '<div class="paper">'
                out += '<div class="conference">' + p.conference + '</div>'
                out += '<div class="citation">'
                out += '<a href=\"' + p.link +'\">' + p.title + '</a><br>' + p.authors
                out += '</div>'
                out += '</div>'
            }
        }
        count++;
    }
    document.getElementById("publications").innerHTML = out;
}

function display_news() {
    var out = '';
    var count = 0;
    for (const key in news) {
        if (count > 3) {
            break;
        }
        if (news.hasOwnProperty(key)) {
            const p = news[key];
            out += '<div class="news-item">'
            out += '<div class="news-date">' + p.date + '</div>'
            out += '<div class="news-text">' + p.text + '</div>'
            out += '</div>'
        }
        count++;
    }
    document.getElementById("news").innerHTML = out;
}

function update_content(){
    display_pubs("");
    display_news();
}
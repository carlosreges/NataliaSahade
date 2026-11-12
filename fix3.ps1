$content = Get-Content services.html -Raw
# Fix nested <p><p> tags
$content = $content -replace '<p>\s*<p>', '<p>'
# Fix item 4 description (still has lorem)
$content = $content -replace 'Cumque ducimus laborum doloribus facere maxime vel earum quidem enim suscipit\.', ''
# Fix item 4 list (got wrong text from item 5)
$content = $content -replace '(<h3 class="list-items__item-title">Autoestima y Crecimiento</h3>\s*</div>\s*<div class="list-items__item-text">\s*<p>\s*Trabajo.*?</p>\s*<ul class="list-services">\s*<li>Comunicación</li>\s*<li>Conflictos</li>\s*<li>Vínculo familiar</li>)', '<p>                                         Trabajo en el fortalecimiento de la autoestima, el autoconocimiento y el crecimiento personal. Acompaño procesos de desarrollo vital y toma de decisiones.</p>                                         <ul class="list-services">                                            <li>Fortalecimiento</li>                                            <li>Autoconocimiento</li>                                            <li>Crecimiento personal</li>')
# Fix item 2 list (Vínculo should be Vínculo familiar)
$content = $content -replace '(<h3 class="list-items__item-title">Terapia de Pareja</h3>\s*</div>\s*<div class="list-items__item-text">\s*<p>\s*Espacio para mejorar.*?</p>\s*<ul class="list-services">\s*<li>Comunicación</li>\s*<li>Conflictos</li>\s*<li>Vínculo</li>)', '$1</li><li>Vínculo familiar</li>'
$content = $content -replace '<li>Vínculo</li>', '<li>Vínculo de pareja</li>'
$content | Set-Content services.html

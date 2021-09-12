{% set words = page.markdown | wordcount %}
{% if words >= 360 %}
<p class="reading-time">🕔 <em>Estimated reading time: {{ (words / 180) | round | int }} minutes</em></p>
{% endif %}

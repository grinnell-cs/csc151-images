---
title: Staff
permalink: /staff
---
<!-- see also: _data/staff.yml and images/staff/ -->
    
## Staff

{% for item in site.data.staff %}

<h3>{{ item.title }}</h3>

{% if item.description %}
{{ item.description }}
{% endif %}

<table>
  {% for person in item.contents %}
  <tr>
    <td>
      {% if person.photo %}
        {% assign photopath = person.photo | prepend: site.baseurl %}
        <img src="{{ photopath }}"
             alt="{{ person.name }}" width="200"/>
      {% endif %}
    </td>
    <td width="25"></td>
    <td>
      <p><b>
          {{ person.name }}
          {% if person.pronouns %}
              ({{ person.pronouns }})
          {% endif %}
      </b></p>
      <p><b>
          {% if person.section %}
              Section {{ person.section }}
          {% endif %}
      </b></p>
      <p>
        {% if person.bio %}
        {{ person.bio }}
        {% endif %}
      </p>
    </td>
  </tr>
  <tr height="25"></tr>
  {% endfor %}
</table>

{% endfor %}


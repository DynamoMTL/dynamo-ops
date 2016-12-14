# collections_filter.rb
#
# Filter individual Jekyll collections items based on arbitrary yam front matter variables.
#
# input - the collection array
# property - key to filter by
# value - desired value
#
# Returns the filtered array of objects
#
# Example usage:
#
#    Assume a collection called "events" exists and we want to find all events
#    where the yaml variable "venue" includes "room 1"
#    and also where yaml variable "time_of_day" includes "evening".
#
#    The yaml variables can be either strings or arrays.
#
#
#    {% assign filtered_events = site.events | collection_filter:"venue", "room 1" | collection_filter:"time_of_day", "evening" %}
#    {% if filtered_events %}
#    <div class="events">
#
#      <h1>Events List</h1>
#
#      {% for event in filtered_events %}
#        <article class="event">
#          {{ event.content | markdownify }}
#        </article>
#      {% endfor %}
#    </div>
#    {% endif %}
module Jekyll
  module CollectionFilter

    def collection_filter(input, property, value)
        filtered_collection = input.select { |article| article.data[property].include? value }
        if filtered_collection.length > 0
            filtered_collection
        else
            false
        end
    end

  end
end

Liquid::Template.register_filter(Jekyll::CollectionFilter)

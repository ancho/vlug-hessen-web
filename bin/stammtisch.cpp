#include "boost/date_time/date_defs.hpp"
#include "boost/date_time/gregorian/gregorian.hpp"
#include <ctime>
#include <iostream>
#include <libical/ical.h>
#include <list>
#include <string>

// https://github.com/libical/libical/tree/master/examples

#define VERSION "2.0"
#define PRODID "-//Stammisch Software//vLUG-Hessen//DE"
#define UID "vlughessen.de"
#define ORGANIZER "mailto:kontakt@vlug-hessen.de"
#define SUMMARY "Stammtisch vLUG-Hessen"
#define DESCRIPTION                                                            \
  "Stammtisch der Virtuellen Linux User Group Hessen im IRC Freenode"
#define LOCATION "IRC Freenode #vlughessen"
#define TZID "Europe/Berlin"

using namespace std;

icalcomponent *calendar;

void create_ical(std::list<boost::gregorian::date> list) {

  calendar = icalcomponent_new(ICAL_VCALENDAR_COMPONENT);
  icalcomponent_add_property(calendar, icalproperty_new_version(VERSION));
  icalcomponent_add_property(calendar, icalproperty_new_prodid(PRODID));

  std::for_each(list.begin(), list.end(), [](boost::gregorian::date &d) {
    icalcomponent *event;

    struct icalperiodtype rtime;
    struct icaltimetype atime;
    atime.year = boost::gregorian::to_tm(d).tm_year + 1900;
    atime.month = boost::gregorian::to_tm(d).tm_mon + 1;
    atime.day = boost::gregorian::to_tm(d).tm_mday;
    atime.hour = 19;
    atime.minute = 0;
    atime.second = 0;

    rtime.start = atime;
    rtime.end = atime;
    rtime.end.hour++;

    event = icalcomponent_new(ICAL_VEVENT_COMPONENT);

    icalcomponent_add_property(event, icalproperty_new_dtstamp(atime));

    struct tm t = boost::gregorian::to_tm(d);
    char *uid = asctime(&t);

    icalcomponent_add_property(event, icalproperty_new_uid(uid));
    icalproperty *property;

    property = icalproperty_new_organizer(ORGANIZER);

    icalproperty_add_parameter(property,
                               icalparameter_new_role(ICAL_ROLE_CHAIR));

    icalcomponent_add_property(event, property);

    icalcomponent_add_property(event,
                               icalproperty_new_description(DESCRIPTION));
    icalcomponent_add_property(event, icalproperty_new_categories("MEETING"));

    icalcomponent_add_property(event,
                               icalproperty_new_class(ICAL_CLASS_PUBLIC));

    icalcomponent_add_property(event, icalproperty_new_created(atime));

    icalcomponent_add_property(event, icalproperty_new_summary(SUMMARY));

    property = icalproperty_new_dtstart(atime);

    icalproperty_add_parameter(property, icalparameter_new_tzid(TZID));
    icalcomponent_add_property(event, property);

    property = icalproperty_new_dtend(rtime.end);

    icalproperty_add_parameter(property, icalparameter_new_tzid(TZID));

    icalcomponent_add_property(event, property);

    icalcomponent_add_property(event, icalproperty_new_location(LOCATION));

    icalcomponent_add_component(calendar, event);
  });
  char *temp = icalcomponent_as_ical_string_r(calendar);
  std::cout << temp << std::endl;
}

int main(int argc, char **argv) {

  std::list<boost::gregorian::date> list;
  boost::gregorian::date d(2018, boost::gregorian::Mar, 6);
  bool thu = true;
  for (int i = 0; i < 30; i++) {
    d += boost::gregorian::weeks(2);
    if (thu) {
      d += boost::gregorian::days(2);
    }
    struct tm t = boost::gregorian::to_tm(d);
    t.tm_hour = 19;
    //    std::cout << asctime(&t);
    list.push_back(d);
    if (thu) {
      d += boost::gregorian::days(-2);
    }
    thu = !thu;
  }

  create_ical(list);

  return 0;
}

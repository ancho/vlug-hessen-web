#include "boost/date_time/date_defs.hpp"
#include "boost/date_time/gregorian/gregorian.hpp"
#include <ctime>
#include <iostream>
#include <string>

using namespace std;

int main(int argc, char **argv) {

  boost::gregorian::date d(2018, boost::gregorian::Mar, 6);
  bool thu = true;
  for (int i = 0; i < 30; i++) {
    d += boost::gregorian::weeks(2);
    if (thu) {
      d += boost::gregorian::days(2);
    }
    struct tm t = boost::gregorian::to_tm(d);
    t.tm_hour = 19;
    std::cout << asctime(&t);
    if (thu) {
      d += boost::gregorian::days(-2);
    }
    thu = !thu;
  }
  return 0;
}

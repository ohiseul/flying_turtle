from urllib.request import urlopen
from bs4 import BeautifulSoup
import pymysql
from datetime import datetime, timedelta

# crawling
html = urlopen("http://www.saramin.co.kr/zf_user/search/recruit?search_area=main&search_done=y&search_optional_item=n&searchType=search&searchword=%EC%9B%B9%EA%B0%9C%EB%B0%9C%EC%9E%90").read().decode("utf-8")
soup = BeautifulSoup(html, "html.parser")

# db
conn = pymysql.connect(host='203.236.209.131', user='flyingturtle',
                       password='helloturtle^', db='flyingturtle', charset='utf8')
cursor = conn.cursor()
sql = "insert into tb_employment(title, url, end_date) values(%s, %s, %s)"

url = "http://www.saramin.co.kr"

for div_tag in soup.find_all("div", {"class": "area_job"}):
    h2_tag = div_tag.find("h2")
    a_tag = h2_tag.find("a")

    date_tag = div_tag.find("div", {"class": "job_date"})
    span_tag = date_tag.find("span")
    str_span = str(span_tag.text)
    print("str_span : ", str_span)

    if '내일' in str_span:
        endDate = str(datetime.today() + timedelta(1)).split(" ")[0]
    elif '오늘' in str_span:
        endDate = str(datetime.today()).split(" ")[0]
    elif '채용' in str_span:
        endDate = '0000/00/00'
    else:
        endDate = str(datetime.today().year) + '/' + span_tag.text[2:7]  # indexing

    print("type : ", type(endDate))
    endDate = endDate.replace("/", "-")
    cursor.execute(sql, (a_tag["title"], url + a_tag["href"], endDate))

conn.commit()
print("SQL 처리 성공...")
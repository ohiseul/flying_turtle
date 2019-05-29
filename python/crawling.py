from urllib.request import urlopen
from bs4 import BeautifulSoup
import pymysql

# crawling
html = urlopen("http://www.saramin.co.kr/zf_user/search/recruit?search_area=main&search_done=y&search_optional_item=n&searchType=search&searchword=%EC%9B%B9%EA%B0%9C%EB%B0%9C%EC%9E%90").read().decode("utf-8")
soup = BeautifulSoup(html, "html.parser")

# db
conn = pymysql.connect(host='host', user='user_id',
                       password='password', db='db_name', charset='utf8')

cursor = conn.cursor()

sql = "insert into tb_employment(title, url) values(%s, %s)"

url = "http://www.saramin.co.kr"

for h2_tag in soup.find_all("h2", {"class": "job_tit"}):
    a_tag = h2_tag.find("a")
    print(a_tag["title"])
    # print("http://www.saramin.co.kr" + a_tag["href"])
    cursor.execute(sql, (a_tag["title"], url + a_tag["href"]))


conn.commit()
print("SQL 처리 성공...")
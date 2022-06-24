#光感自動偵測大燈開門裝置

介紹：

使用光敏電阻製作出能夠使用感應大燈來自動開關大門的裝置，並上傳資料庫進行車輛記數並顯示在電腦上。

使用光敏電阻做感測，感測到大燈會開啟閘門等待等待車輛經過，若還有燈光會繼續開啟，每經過一台車會計數和顯示在網頁上並且能將數據保存到資料庫裡面。

8051portser.ipynb 接收8051透過uart to TTL到電腦的數據 並且 將收到數據顯示 還有上傳到資料庫 Mysql

8051 ADC CODE 使用組合語言撰寫是 寫入到8051裡面跑的

![image](https://user-images.githubusercontent.com/66985520/175522535-faeffd9a-c12e-4309-88a3-ac91add8164d.png)

左邊為8051本體 右邊為ADC0804數位類比轉換IC 而左下是USB轉UART TTL

![image](https://user-images.githubusercontent.com/66985520/175522641-91da140c-c01e-4580-b111-91cfd3f47b2e.png)

此為電路板放置於機構的上方支撐柱上

![image](https://user-images.githubusercontent.com/66985520/175522659-fb1d119f-aa03-4b09-9261-233755e00900.png)

伺服馬達在左下角帶動欄杆來阻攔車輛

![image](https://user-images.githubusercontent.com/66985520/175522675-4865ea45-8cd9-482d-8fd6-8dd4290dd929.png)

前端(網頁)畫面 使用的是Grafana

![image](https://user-images.githubusercontent.com/66985520/175522706-67e2693d-d1cc-437f-a184-454a8c5694fe.png)

資料庫MySQL畫面

我將車輛資料分為 

id(自動編號由先至後方式)

car 通過的車輛 每次8051發訊號給電腦後 電腦送過來都是一台

passtime通過時間(由電腦抓取時間為基準)

carmin本次實作 無作用 本要做每分鐘統計 但由於上面介紹的監控系統已有此功能

![image](https://user-images.githubusercontent.com/66985520/175522771-85ea93e7-cdaa-4bdc-a980-d251d49b1902.png)

流程圖

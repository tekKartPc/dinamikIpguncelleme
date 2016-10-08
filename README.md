[tekKartPc.com](http://tekkartpc.com/dinamik-ip-cozumumuz/) / Dinamik İp guncelleme
 
=========

Evimizde - çalışma yerimizde, internete bağlı olan tek kart pc ( RaspberryPi, OrangePi vb ) veya  bilgisayarımıza erişmek ve çeşitli işlemler yaptırmak isteriz. 

Kullandığınız internet bağlantısının ip adresi sürekli değişiyor olabilir. 
İp adresinizi sürekli güncel olarak takip etmek için, dynamicDns veya benzeri bir hizmet kullanmalısınız.

Peki, kendinize ait bir hosting ( veya sunucu ) üzerinden sürekli değişen ip adresinizi takip etseniz daha iyi olmaz mı ?

Peki, nasıl olacak ? 
Genel olarak bu uygulamacık (script) ile şu şekilde gerçekleştirmiş olacağız;

![](http://tekkartpc.com/yukle/2016/10/dinaik_ip_guncelleme_1.png)

1. Açık olan tek kart mini pc veya açık bilgisayarımızdan crontab-curl aracılığı ile hostinginizin bulunduğu makineye istek göndermek.
2. Hosting-Sunucunuz üzerinden, bu isteği karşılayıp, dinamik ip adresimizi txt dosyaya yazacak bir php dosyası oluşturmak !

Bu işlemlere başlamadan önce Raspberry Pi veya tek kart pc cihazınızı kullanıma hazır hale getirdiğinizi varsayıyoruz; 
Şayet çalıştıramadıysanız lütfen [tekKartPc.com](http://tekkartpc.com/rasberry-pi-acilmama-ve-kirmizi-isik-problemi-cozumu/) sitemiz üzerinden yorumları kullanarak soru sorabilirsiniz.

Hazırlık 
--------------
* tek kart pc cihazınıza ssh ile bağlandıktan sonra

  ```sh
  cd /home/pi
  ```
  
* "dinamikIpguncelleme" repomuzu indirmek için git clone komutunu kullanıyoruz

  ```sh
  git clone https://github.com/tekKartPc/dinamikIpguncelleme.git
  ```
  Eğer, ["bash git command not found" gibi bir hata alıyorsanız, önce buraya bakın](http://tekkartpc.com/ufak-notlar-bash-git-command-not-found-hatasi/) !...
  
  
* dinamikIpguncelleme isimli dizine giriyoruz.

  ```sh
  cd dinamikIpguncelleme
  ```
  
* scriptimize çalıştırma izni veriyoruz

  ```sh
  chmod +x dinamik_ip_guncelleme.sh
  ```
  Buraya kadarki görüntü şu şekilde olmalıdır!
  ![](http://tekkartpc.com/yukle/2016/10/dinaik_ip_guncelleme_kurulum_adim_1.png)
  
Kurulum
--------------
* artık çalıştırabiliriz scriptimizi

  ```sh
  sudo ./dinamik_ip_guncelleme.sh
  ``` 
* İlk soru site adresinizdir. İlla isim olmasına gerek yok ( http://178.187.871.718 ip de verebilirsiniz )
  Site isminizi yazarken sonunda "/" karakteri olmasın. örn --> http://tekkartpc.com

  ```sh
  http://sitenizinadi.com
  ``` 
  

* Tek kart mini bilgisayarınızdan çıkacak olan istekleri karşılaması için bir php dosyası oluşturulacak.
  Bu php dosyasına tahmin edilemeyecek bir isim vermeniz çok önemli !

  ```sh
  ___ip_guncelleme.php
  ``` 
* Son soruda, ip adresiniz kaç dakikada bir güncellensin. Yani, sahip olduğunu internetin dinamik ip bilgisi, ne kadar da bir kaydedilsin ? 30 dkk idealdir. Ama yapacağınız işin önemine binaen 5 dkk bile verebilirsiniz. 

  ```sh
  30
  ``` 
Kurulum bittiğinde şu şekilde bir görüntü olmalıdır
![](http://tekkartpc.com/yukle/2016/10/dinaik_ip_guncelleme_kurulum_adim_2.png)
  
  
Kontrol ve Dosya upload
--------------
* Tek kart mini bilgisayarımızda işlem doğru şekilde gerçeleşmiş mi kontrol !

  ```sh
  sudo crontab -l
  ``` 
  Eğer şu şekide bir çıktı var ise doğru demektir --> 
  
  "*/30 * * * * curl http://sitenizinadi.com/___ip_guncelleme.php >/dev/null 2>&1"
  Artık oluşturulan __ip_guncelleme.php dosyamızı, sunucumuza veya hosting alanımıza upload edebiliriz !
  
İşlemler bitti. Peki güncel ip adresimizi nasıl takip edeceğiz ?

  ```sh
  http://sitenizinadi.com/___ip_guncelleme.txt
  ``` 
Oluşturduğumuz php dosyası, aynı isimde yeni bir txt dosyası açar ve ip bilginizi bu txt dosyasına yazar.
Sizde tarayıcınız vasıtası ile her yerden ( ister telefon isterseniz bilgisayarınız ) erişebilirsiniz !


  

[UYARI]
--------------
Burada yapılacak işlemlerde, TekKartPc.com 'un herhangi bir menfaati veya uygulaması olmayıp, sorumluluk almamaktadır. 
Konu hakkında bilginiz yok ise lütfen bir danışmandan yardım isteyin !

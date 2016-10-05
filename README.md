[tekKartPc.com](http://tekkartpc.com/dinamik-ip-cozumumuz/) / Dinamik İp guncelleme
 
=========

Evimizde - çalışma yerimizde, internete bağlı olan tek kart pc ( RaspberryPi, OrangePi vb ) veya  bilgisayarımıza erişmek ve çeşitli işlemler yaptırmak isteriz. 

İndirmek istediğiniz BÜYÜK boyutlu bir dosyayı, siz eve gidene kadar inmiş olsa ve direk kullansanız güzel olmaz mı ?
Veya yazdığınız-kullandığınız bir uygulamada uzun sürecek işlem için kullansanız ? 

Kullandığınız internet bağlantısının ip adresi sürekli değişiyor olabilir. 
İp adresinizi sürekli güncel olarak takip etmek için, dynamicDns veya benzeri bir hizmet kullanmalısınız.

Peki, kendinize ait bir hosting ( veya sunucu ) üzerinden sürekli değişen ip adresinizi takip etseniz daha iyi olmaz mı ?

Peki, nasıl olacak ? 
Genel olarak bu uygulamacık (script) ile şu şekilde gerçekleştirmiş olacağız;

1. Açık olan tek kart mini - bilgisayarınıza crontab-curl aracılığı ile hostinginizin bulunduğu makineye istek göndermek.
2. Hosting-Sunucunuz üzerinden, bu isteği karşılayıp, dinamik ip adresini txt dosyaya yazacak bir php dosyası oluşturmak !

Bu adımları 

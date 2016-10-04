#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import os,commands;
os.getcwd()

class bcolors:
	HEADER = '\033[95m'
	OKBLUE = '\033[94m'
	OKGREEN = '\033[92m'
	WARNING = '\033[93m'
	FAIL = '\033[91m'
	ENDC = '\033[0m'

print(" ------------------------------------------------------------------------------------------------------------------------------")
print(" \n \n ") 
print(" 888             888      888    d8P                   888    8888888b.                                               ")
print(" 888             888      888   d8P                    888    888   Y88b                                              ")
print(" 888             888      888  d8P                     888    888    888                                              ")
print(" 888888  .d88b.  888  888 888d88K      8888b.  888d888 888888 888   d88P  .d8888b      .d8888b  .d88b.  88888b.d88b.  ")
print(" 888    d8P  Y8b 888 .88P 8888888b        \"88b 888P\"   888    8888888P\"  d88P\"        d88P\"    d88\"\"88b 888 \"888 \"88b ")
print(" 888    88888888 888888K  888  Y88b   .d888888 888     888    888        888          888      888  888 888  888  888 ")
print(" Y88b.  Y8b.     888 \"88b 888   Y88b  888  888 888     Y88b.  888        Y88b.    d8b Y88b.    Y88..88P 888  888  888 ")
print("  \"Y888  \"Y8888  888  888 888    Y88b \"Y888888 888      \"Y888 888         \"Y8888P Y8P  \"Y8888P  \"Y88P\"  888  888  888 ")
print(" \n \n ")
print(" ------------------------------------------------------------------------------------------------------------------------------")

if commands.getoutput("whoami") != "root":
	print( "\n" + bcolors.WARNING+" lütfen "+ bcolors.FAIL+" sudo yetkisi ile çalıştırın !... \n "+bcolors.ENDC)
	exit();

print("curl bilgisi kontrol ediliyor...")
ss = commands.getoutput("dpkg -V curl")

if len(ss) > 0:
	commands.getoutput("sudo apt-get install -y curl")
	print("\n curl paketi kuruldu \n")
else:
	print("\n curl paketi kurulu \n")

#kullaniciAdi = raw_input( "\n "+ bcolors.OKBLUE + "Kullanıcı adını giriniz ( ön tanımlı: 'pi' ): "+bcolors.ENDC )
#if kullaniciAdi == "": kullaniciAdi = "pi"
#print("\n Zamanlanmış görevi uygulayacak olan kullanıcı '"+kullaniciAdi+"' olarak atandı. \n ")

HostingUrl 	= ""
is_valid	= 0
 
while not is_valid :
	try :
		HostingUrl = raw_input(bcolors.OKBLUE + "Sitenizin adresini sonunda \"/\" olmadan giriniz ( örn: http://tekkartpc.com ): "+bcolors.ENDC )
		if len(HostingUrl) > 10:
			is_valid = 1
		else:
			print ("\n " + bcolors.WARNING+" lutfen "+ bcolors.FAIL+" sitenizin adresini doğru şekilde giriniz !... \n "+bcolors.ENDC)
	except ValueError, e :
		print ("\n '%s' " + bcolors.WARNING+" lutfen "+ bcolors.FAIL+" sitenizin adresini doğru şekilde giriniz !... \n "+bcolors.ENDC, HostingUrl)




print("\n sitenizin url bilgisi '"+HostingUrl+"' olarak atandı. \n ")

PhpDosyasi = raw_input( "\n "+ bcolors.OKBLUE + "Php dosyanızın ismini giriniz ( örn: __tahmin_edilmeyecek_dosya_ismi.php ): "+bcolors.ENDC )

print("\n Oluşturacak php dosya ismi '"+PhpDosyasi+"' olarak atandı. \n Tek Kart Pc 'nizin istek yapacağı url şu şekildedir; '"+HostingUrl+"/"+PhpDosyasi+"' \n ")



is_valid	= 0
while not is_valid :
	try :
		KacDakika = int ( raw_input( "\n "+ bcolors.OKBLUE + "Kaç dakikada bir güncellenecek : "+bcolors.ENDC ) )
		if KacDakika > 0:
			is_valid = 1
		else:
			print ("\n " + bcolors.WARNING+" lutfen "+ bcolors.FAIL+" bir sayı giriniz !... \n "+bcolors.ENDC)
	except ValueError, e :
			print ("\n " + bcolors.WARNING+" lutfen "+ bcolors.FAIL+" bir sayı giriniz !... \n "+bcolors.ENDC)

print("\n İp bilgisi güncelleme aralığı '"+str(KacDakika)+"' dakika olarak atandı. \n ")
print("\n İp bilginizin gönderilmesi, zamanlı görev ataması ile '"+str(KacDakika)+"' dakikada bir yapılacak şekilde atandı. \n ")

cronGorev = "*/"+str(KacDakika)+" * * * * curl "+HostingUrl+"/"+PhpDosyasi+" >/dev/null 2>&1"
#print("crontab -l | { cat; echo '"+cronGorev+"'; } | crontab -")
commands.getoutput("crontab -l | { cat; echo '"+cronGorev+"'; } | crontab -")

dosyaIcerigi = """<?php // tekKartPc.com aracılığı ile ;)
echo '<h1> ip adresiniz: '.$_SERVER['REMOTE_ADDR'].' </h1>'; //denemenizi yaptıktan sonra bu satırı yorum satırına çeviriniz ! 
$file = fopen('"""+PhpDosyasi+""".txt','w');
fwrite($file, $_SERVER['REMOTE_ADDR']);
fclose($file);
"""

VHostDosya = open(PhpDosyasi, "w")
VHostDosya.write(dosyaIcerigi)
VHostDosya.close()

print("İşlem tamamlanmıştır. Lütfen oluşturulan '"+PhpDosyasi+"' isimli dosyayı hostinginize gönderin (upload)")
# \n crontab -l komutunu çalıştırdıktan sonra aşağıdaki satırı göremiyorsanız \n")
#print("lütfen crontab -e komutunu yazdıktan sonra ekleyin \n")print(cronGorev)













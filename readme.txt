Didalam satu branch master terdapat 4 file utama yaitu: 2 skema dan 2 file dumps sql. Skema bisa dibuka menggunakan mysql workbench CE.

db_sales_simple.

	ITENERARY
	•	Satu descripsi itenary akan disimpan dalam satu record di database
	missal :
	day 1:
		itenary 1.1
		itenary 1.2
		itenary 1.3
	day 2:
		itenary 2.1
		itenary 2.2
		itenary 2.3

	Itenary 1 sampai tiga akan disimpan di database sebagai record. Sehingga itenary day 1 mempunyai 3 record dengan atribut day di beri nilai 1. Kumpulan itenary ini juga akan di record menjadi satu record tersendiri yaitu collection. Sehingga satu id collection akan berisi urutan itenary lengkap.
	•	Itenerary menjadi bagian dari informasi package.
	PACKAGE
	•	Package akan mempunyai package type. Dimana sekarang terdapat dua package type yaitu tour dan activity.
	•	Package tour akan mempunhyai informasi hotel. Sedangkan activity tidak mempunyai.
	•	Special prize bisa diberikan pada beberapa pricing saja, sehingga tidak perlu semua pricing mempunyai special price.
	Untuk skema ini masih dimungkinkan  adanya redundansi pada record package. Selain itu, field hotel akan kosong bila pricing yang akan di simpan untuk activity.

db_sales
	untuk skema ini, saya mencoba membuat skema se normal mungkin. Akibatnya terlalu sulit mengolah datanya untuk digunakan dilevel aplikasi.
	Di skema ini package bisa di buat per tipe hotel. Setiap package yang ditawarkan bisa dibuat detail hotel yang akan di inginkan. 
	Misal 1 malam di hotel a, sedangkan malam lain di hotel b. Info hotel juga sudah di turunkan sampai room. 
	sehingga satu hotel bisa di libatkan dalam banyak record dengan hanya mencantumkan room nya.
	Di db ini lebih memungkinkan menyimpan data package yang lebih bermacam-macam jenis.
	Itenerary di skema ini sama seperti di db simple, bedanya di sini juga mencantumkan tempat dimana itenerary akan dilaksanakan. Sebenarnya tanpa mencantumkan info tersebut juga tidak menjadi masalah. Sesuai kebutuhan saja.
	Untuk hotel sendiri di generalisasi menjadi tourism place, sehingga hotel hanya menambah field rating star saja, selain itu di inherit dari tourism place.
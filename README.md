
  
# Relazione Progetto Tecnologie Web

## Demo

[https://wegym-tecweb.herokuapp.com](https://wegym-tecweb.herokuapp.com)

## Credenziali Admin

* username: admin
* password: admin

## Abstract

Il progetto rappresenta il sito di una palestra chiamata WeGym, esso si propone di
fornire un centro di informazioni relative alla palestra e non prevede nessuna
interazione con l’utente esterno. Il sito contiene al suo interno varie sezioni che
permettono con facilità all’utente di trovare ciò di cui è in cerca. Le sezioni sono le
seguenti: Home, Galleria, Corsi, Prodotti ed Info. Nella Home viene presentata la
palestra, nella Galleria vengono mostrate le sale della palestra, in Corsi vengono
esposti i corsi offerti, in Prodotti l’utente può cercare attraverso alcuni parametri
(prezzo e categoria) la merce in vendita in palestra (non è previsto l’acquisto online).
Info contiene tutte le informazioni (contatti, numeri, indirizzi, orari) della palestra.
E’ prevista una parte di amministrazione, l’utente amministratore deve effettuare il
login con le credenziali admin:admin, in questo modo avrà accesso al pannello di
amministrazione che permette l’aggiunta o la rimozione di corsi, prodotti, immagini
della galleria.

## Destinatari

Il sito non ha un target specifico di utenti e proprio per questo è stato progettato per
essere comprensibile e facilmente accessibile da tutti rendendo immediato il
raggiungimento dell’informazione ricercata.

## Accessibilità

Come richiesto dagli standard W3C è stato mantenuta la **separazione tra
contenuto, presentazione e struttura**. Nel codice HTML non sono presenti righe di
stile e nemmeno righe di javascript e quest’ultimo, al fine di fornire un sito
accessibile anche a chi abbia javascript disabilitato, è stato utilizzato in forma
minima e solamente per abbellire l’apparenza del sito. Senza javascript il sito rimane
quasi identico e perfettamente funzionante.

I **colori dei link** e gli effetti su di essi quando ci si posiziona sopra col mouse
permettono un facile riconoscimento dei collegamenti da parte dell’utente. Inoltre tutti
i link presenti che non sono nella sidebar a sinistra sono sottolineati. I link presenti
nei div footer e path hanno un colore diverso dagli altri in quanto lo sfondo di questi
div è del colore usato per gli atri link, rimane comunque facilmente intuibile che essi
sono link a tutti gli effetti.

Grazie all’utilizzo del sito [http://vischeck.com](http://vischeck.com) abbiamo potuto verificare che lo
schema colori utilizzato (verde-nero) risulta utilizzabile normalmente anche da chi ha
disturbi di vario tipo alla vista, come dimostrato di seguito.

Sono stati introdotti aiuti per le persone che utilizzano gli screenreader, tali aiuti
consistono nell’utilizzo di: tag che specificano la lingua di una certa parola, tag per le
abbreviazioni, attributi alt per descrivere le immagini, attributi title per fornire
informazioni su un determinato elemento, link per spostarsi all’ interno della pagina
(torna al menu, salta navigazione…).
Escluse le due immagini nel footer a cui l’attributo alt è stato lasciato vuoto
intenzionalmente, le altre immagini nel sito sono tutte di contenuto ed hanno
l’attributo alt che le descrive.
Le tabelle presenti nella parte di amministrazione sono state rese accessbili
mediante le tecniche studiate durante il corso.

Per ogni pagina pubblica (non di amministrazione) sono stati utilizzati dei tag meta
per meglio descrivere il contenuto della pagine e avere maggior visibilità ai motori di
ricerca.

## Struttura del sito

Il sito ha volutamente un layout molto semplice per le ragioni discusse nel paragrafo
2, nella versione Desktop è presente un path sotto all’header per far si che l’utente
non si perda all’interno del sito e una barra di navigazione sulla parte laterale
sinistra dello schermo per permettere all’utente una ricerca semplice ed efficace
delle informazioni cercate, mentre il form per il login amministratore è sulla destra.
Nella versione tablet (width<=769px) invece la barra di navigazione non si trova più
a lato bensì in alto subito dopo al path, mentre in fondo è stato inserito un link che
porta al login per l’amministratore, analogamente per la versione mobile
(width<=600), dove però scompare il path.

La parte pubblica è così strutturata:

* **Homepage**: vi è presente una breve descrizione e storia di WeGym
* **Galleria**: vi sono presenti le foto delle varie sezioni della palestra
* **Corsi**: vi sono elencati i corsi della palestra con un’immagine allegata per ciascuno
* **Prodotti**: vi sono elencati i nostri prodotti ed un form per il filtro dei risultati
* **Info**: vi sono le informazioni sulla posizione della palestra e i vari contatti

La parte amministrativa è così strutturata:

* **Login**: pagina dedicata al login che, se andato a buon fine, inizierà la session
attraverso lo script login.cgi, per finirla verrà invece invocato logout.cgi
* **Corsi**: permette di aggiungere o rimuovere corsi attraverso gli script
nuovo_corso.cgi e cancella_corso.cgi
* **Galleria**: permette di aggiungere o rimuovere foto nella galleria attraverso lo script
nuova_immagine_galleria.cgi e cancella_immagine_galleria.cgi
* **Prodotti**: permette di aggiungere o rimuovere prodotti attraverso lo script
nuovo_prodotto.cgi e cancella_prodotto.cgi

Inoltre sono presenti degli script in Perl per il check dei form per l’inserimento dei dati
e il filtro dei prodotti in prodotti.cgi.

## Struttura dei file

Il sito è composto da 3 cartelle: public_html, cgi-bin e data.
* **public_html** contiene le cartelle images, css e js. images contiene le immagini
utilizzate nel sito, css contiene gli stili (styles.css e print.css), js contiene gli script
utilizzati, nav.large.js è lo script originale, con l’utilizzo di [http://jscompress.com/](http://jscompress.com/) è stato generato il codice presente in nav.js che è di fatto l’unico file che viene caricato
nelle pagine html. In public_html è presente un’unica pagina html (index.html) il cui
unico scopo è effettuare il redirect a cgi-bin/index.cgi, che è l’homepage del sito.
* **cgi-bin** contiene tutte le pagine pagine del sito e gli script che servono per il
corretto funzionamento.
* **data** contiene i file xml e gli XMLSchema relativi, nella versione presente sul server
di TecWeb sono stati rimossi tutti i riferimenti ai namespace presenti nei file xml.

## Gestione dei dati

Il sito presenta 3 tipi di contenuti che possono essere modificati dall’amministratore
dalle rispettive pagine di amministrazione:
* **Galleria**: in galleria_admin.cgi, come descritto prima, è possibile aggiungere e
rimuovere le immagini presenti all’interno della galleria tramite gli script
nuova_immagine_galleria.cgi e cancella_immagine_galleria.cgi, questi andranno a
modificare il file galleria.xml.
* **Corsi**: in corsi_admin.cgi, come descritto prima, è possibile aggiungere e rimuovere
i corsi tramite gli script nuovo_corso.cgi e cancella_corso.cgi, questi andranno a
modificare il file corsi.xml.
* **Prodotti**: in prodotti_admin.cgi, come descritto prima, è possibile aggiungere e
rimuovere i corsi tramite gli script nuovo_prodotto.cgi e cancella_prodotto.cgi, questi
andranno a modificare il file prodotti.xml.
Per verificare la validità dei dati sono stati creati degli appositi XMLSchema che
definisco i vari tag che possono comparire nei file .xml. La validità degli schemi
rispetto ai file .xml è stata verificata tramite l’utilizzo del tool di validazione proposto
da [http://www.utilities-online.info/xsdvalidation/](http://www.utilities-online.info/xsdvalidation/).

## Validazione

Tutte le pagine del sito, comprese le pagine di amministrazione, sono state validate
con TotalValidator e con il validator online [https://validator.w3.org](https://validator.w3.org) riporta 2 warning per ogni pagina, essi avvisano che sono presenti immagini in cui il tag alt è presente ma risulta vuoto, tuttavia, come detto sopra, ciò è intenzionale e lo scopo è quello di nascondere le immagini allo screenreader in quanto tali immagini non sono di contenuto e totalmente ignorabili da un utente non vedente per l’utilizzo del sito.

## Pianificazione

| **Membro**  | **Attività** | 
| ------------------------- | ------------- |
|  Saraci Eugen | <ul><li>Visualizzazione dei dati per corsi, prodotti, galleria</li><li>Realizzazione della maggior parte del codice HTML</li><li>Lavoro e gestione dei layout e file di stile .css</li><li>Gestione e verifica del codice per la corretta visualizzazione su diversi “device”</li></ul> | 
|  Serbanoiu Dan | <ul><li>Progettazione e creazione dei file XML per prodotti, galleria e corsi</li><li>Form per aggiunta dei dati</li><li>Motore di ricerca e paginazione prodotti e prodotti admin</li><li>CSS dei form, dei prodotto, della galleria</li></ul> | 
|  Tabacariu Nicolae Andrei | <ul><li>Validazione del codice</li><li>Integrazione delle funzioni JavaScript</li><li>Lavoro HTML e CSS</li><li>Lavoro XML schema</li> |
|  Mali Tomas |  <ul><li>Cancellazione dei dati con perl per prodotti, galleria, corsi</li><li>Recupero dei contenuti</li><li>Lavoro HTML e CSS</li><li>Realizzazione della relazione</li></ul> |




 

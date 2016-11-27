function prüfung(){
	Passwort = document.getElementById("passwort").value;
	Bestätigung = document.getElementById("passwort bestätigung").value;
	Vorname = document.getElementById("vorname").value;
	Nachname = document.getElementById("nachname").value;
	Nachname = document.getElementById("nachname").value;
	Email = document.getElementById("mail").value;
	EmailBe = document.getElementById("mailbestätigung").value;
	
		if(Vorname == "")  {
		   alert("Bitte geben sie ihren Vornamen ein!");
		   document.Formular.vorname.focus();
		   return false;
		  }
		 if(Nachname == "") {
		   alert("Bitte geben sie ihren Nachnamen ein!");
		   document.Formular.nachname.focus();
		   return false;
		  }
		 if(Passwort != Bestätigung){
				alert("Bitte Passwort überprüfen!")
				document.Formular.Bestätigung.focus();
			   	return false;
		}
		 if(Mail == "") {
		   alert("Bitte Ihre E-Mail-Adresse eingeben!");
		   document.Formular.mail.focus();
		   return false;
		  }
		 
		 if(MailBe == ""){
		   alert("Bitte geben Sie erneut Ihre Email ein");
		   document.Formular.mailbestätigung.focus();
		   return false;
		  }
		 
		 if(Mail != MailBe) {
		   alert("Ihre Email stimmt nicht Überein!");
		   document.Formular.mailbestätigung.focus();
		   return false;
		  }
		 
}
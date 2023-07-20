#!/usr/bin/python

import imaplib

def getPassword(username):
	import subprocess
	wallet = subprocess.run('qdbus org.kde.kwalletd5 /modules/kwalletd5 org.kde.KWallet.open kdewallet 0 kdewallet'.split(), stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
	return subprocess.run((f'qdbus org.kde.kwalletd5 /modules/kwalletd5 readPassword {wallet} gmailAppPasswords {username} Nextcloud').split(), stdout=subprocess.PIPE).stdout.decode('utf-8').strip()

def getMail(username, password):
	# set up connection to Gmail server
	mail = imaplib.IMAP4_SSL('imap.gmail.com')
	mail.login(username, password)

	# select mailbox (e.g., INBOX)
	mail.select('INBOX')

	# search for all unread mails
	status, response = mail.search(None, 'UNSEEN')

	# get the number of unread mails
	unread_count = len(response[0].split())

	# print the number of unread mails
	#print(f'Number of unread mails: {unread_count}')

	# close mailbox and logout from server
	mail.close()
	mail.logout()
	return unread_count


unread = getMail("tubbadu@gmail.com", getPassword("tubbadu@gmail.com")) + getMail("ale.ribau@gmail.com", getPassword("ale.ribau@gmail.com"))
icon = "mail-mark-unread-new" if (unread > 0) else "mail-mark-unread"
tooltip = str(unread) + " unread mail" + ("s" if unread != 1 else "")
status = "active" if (unread > 0) else "passive"
print("{PlasmoidIconStart}" + icon + "{PlasmoidIconEnd}")
print("{PlasmoidTooltipStart}" + tooltip + "{PlasmoidTooltipEnd}")
print("{PlasmoidStatusStart}" + status + "{PlasmoidStatusEnd}")

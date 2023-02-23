#!/usr/bin/python

import imaplib

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


print(getMail("tubbadu@gmail.com", "cbebmtimyehtejlk") + getMail("ale.ribau@gmail.com", "qzwcfvkweuqgddef"))
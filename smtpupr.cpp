#include "smtpupr.h"

smtpupr::smtpupr(QObject *parent) : QObject(parent)
{

}

QList<QString> list;
QList<QString> filelist;
QString from;
// "HwebTfyuevnvRCQccez7"
Smtp* smtp;
QString logixn, passwoxrd, servxer, poxrt;

void smtpupr::connect(QString login, QString password, QString server, QString port)
{
    logixn = login;
    passwoxrd = password;
    servxer = server;
    poxrt = port;

    qDebug() << "Sendfdfded";
}

void smtpupr::addEmail(QString email)
{
    list.append(email);

}

void smtpupr::removeEmail(int email)
{
    list.remove(email);
}

QString smtpupr::deleteF(QString file)
{
    file.remove("file:///");
    return file;
}

void smtpupr::addFile(QString file)
{
    file.remove("file:///");
    filelist.append(file);
    qDebug() << filelist;
}

void smtpupr::send(QString msg, QString subject)
{
    qDebug() << "22ended";
    for (int i = 0; i < list.size(); i++)
    {
        smtp = new Smtp(logixn, passwoxrd, servxer, poxrt.toInt());
        smtp->sendMail(logixn, list[i], subject, msg, filelist);
    }
}

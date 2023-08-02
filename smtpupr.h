
#ifndef SMTPUPR_H
#define SMTPUPR_H

#include <QObject>
#include <smtp.h>

class smtpupr : public QObject
{
    Q_OBJECT
public:
    explicit smtpupr(QObject *parent = nullptr);

public slots:
    void connect(QString login, QString password, QString server, QString port);
    void addEmail(QString email);
    void send(QString msg, QString subject);
    void addFile(QString file);
    QString deleteF(QString file);
};

#endif // SMTPUPR_H

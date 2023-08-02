
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <smtp.h>
#include <windows.h>
#include <QQmlContext>
#include <smtpupr.h>

void Smtpx()
{
    QList<QString> s;
    s.append("C:\\Users\\maxma\\Documents\\untitled42\\minimize_icon.svg");
    Smtp* smtp = new Smtp("anonym.zxc@mail.ru", "HwebTfyuevnvRCQccez7", "smtp.mail.ru", 465);
    smtp->sendMail("anonym.zxc@mail.ru", "ivayayw@yandex.ru" , "OralCumshot", "Huy", s);
}

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/untitled42/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    smtpupr smt;

    QQmlContext *rootc = engine.rootContext();
    rootc->setContextProperty("smtp", &smt);

    //QList<QString> s;
    //s.append("C:\\Users\\maxma\\Documents\\untitled42\\minimize_icon.svg");
    //Smtp* smtp = new Smtp("anonym.zxc@mail.ru", "HwebTfyuevnvRCQccez7", "smtp.mail.ru", 465);
    //smtp->sendMail("anonym.zxc@mail.ru", "ivayayw@yandex.ru" , "OralCumshot", "Huy", s);

    return app.exec();
}

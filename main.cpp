#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCryptographicHash>
#include <QDebug>
#include <ctime>
#include <cstdlib>
#include <time.h>

int numOfSmallChars;
int numOfBigChars;
int numOfNumbers;

int main(int argc, char *argv[])
{


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QString blah = QString(QCryptographicHash::hash(("myPassword"),QCryptographicHash::Md5).toHex());
    qDebug() << blah;

    /*srand(time(NULL));

    char * password;

    password = new char [10];

    numOfSmallChars = rand() % 10;
    int charRandEnd = 10 - numOfSmallChars;
    numOfBigChars = rand() % charRandEnd;
    numOfNumbers = 10 - numOfSmallChars - numOfBigChars;

    qDebug() << numOfSmallChars << numOfBigChars << numOfNumbers;

    for (int i = 0; i < numOfNumbers; ++i) {
        password [i] = char(rand() % 10 + 48);
    }
    for (int i = numOfNumbers; i < numOfNumbers + numOfBigChars; ++i) {
        password [i] = char(rand() % 26 + 65);
    }
    for (int i = numOfNumbers + numOfBigChars; i < 10; ++i) {
        password [i] = char(rand() % 26 + 97);
    }

    std::random_shuffle(password, password + 10);*/


    //QString pass = password;

    //111

    qDebug() << "Test";

    return app.exec();
}

void passGenerator(int passLenght)
{

}

void numOfChars(int passLenght)
{

}

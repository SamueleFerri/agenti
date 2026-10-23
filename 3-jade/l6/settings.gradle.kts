import java.security.cert.X509Certificate
import javax.net.ssl.*
import javax.net.ssl.HttpsURLConnection

rootProject.name = "lab-jade"

var nullTrustManager: X509TrustManager = object : X509TrustManager {
    override fun checkClientTrusted(chain: Array<X509Certificate>, authType: String) = Unit
    override fun checkServerTrusted(chain: Array<X509Certificate>, authType: String) = Unit
    override fun getAcceptedIssuers(): Array<X509Certificate?> = arrayOfNulls(0)
}

var nullVerifier: HostnameVerifier = object : HostnameVerifier {
    override fun verify(hostname: String, session: SSLSession): Boolean = true
}

with(SSLContext.getInstance("SSL")) {
    init(null, arrayOf(nullTrustManager), null)
    HttpsURLConnection.setDefaultSSLSocketFactory(getSocketFactory())
    HttpsURLConnection.setDefaultHostnameVerifier(nullVerifier)
}


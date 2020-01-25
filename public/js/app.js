let auth0 = null;
const fetchAuthConfig = () => fetch("/auth_config.json");
const configureClient = async () => {
    const response = await fetchAuthConfig();
    const config = await response.json();

    auth0 = await createAuth0Client({
        domain: config.domain,
        client_id: config.client_id
    });
};

window.onload = async () => {
    await configureClient();

    updateUI();

    const isAuthenticated = await auth0.isAuthenticated();

    if (isAuthenticated) {
        return;
    }

    const query = window.location.search;
    if(query.includes("code=") && query.includes("state")) {
        await auth0.handleRedirectCallback();

        updateUI();

        window.history.replaceState({}, document.title, "/");
    }
};

const updateUI = async () => {
    const isAuthenticated = await auth0.isAuthenticated();

    document.getElementById("btn-logout").disabled = !isAuthenticated;
    document.getElementById("btn-login").disabled = isAuthenticated;

    if (isAuthenticated) {
        document.getElementById("user-name").classList.remove("hidden");

        document.getElementById(
            "ipt-access-token"
        ).innerHTML = await auth0.getTokenSilently();

        document.getElementById("ipt-user-profile").innerHTML = JSON.stringify(
            await auth0.getUser()
        );
    } else {
        document.getElementById("user-name").classList.add("hidden");
    }
};

const login = async () => {
    await auth0.loginWithRedirect({
        redirect_uri: window.location.origin
    });
};


const logout = () => {
    auth0.logout({
        returnTo: window.location.origin
    });
};


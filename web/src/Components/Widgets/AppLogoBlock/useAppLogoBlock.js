const useAppLogoBlock = () => {
    const generalSpaceStyle = {
        marginBottom: 40
    };
    const imageSpaceStyle = {
        display: "flex",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
    };
    const imageStyle = {
        width: 100,
        marginBottom: 10,
        borderRadius: 20,
        border: "1px solid #ddd",
    };
    const imageCaptionStyle = {
        textAlign: "center",
        color: "#1890ff",
        fontWeight: "bold",
        fontSize: 68,
    };
    const descriptionStyle = {
        textAlign: "center",
        color: "#1890ff",
        fontWeight: "bold",
        fontSize: 28,
    };

    return {
        generalSpaceStyle,
        imageSpaceStyle,
        imageStyle,
        imageCaptionStyle,
        descriptionStyle,
    }
};

export default useAppLogoBlock;
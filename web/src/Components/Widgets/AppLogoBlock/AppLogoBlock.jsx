import {Image, Space, Typography} from "antd";
import React from "react";
import useAppLogoBlock from "./useAppLogoBlock.js";

const {Text} = Typography;

const AppLogoBlock = () => {
    const {
        generalSpaceStyle,
        imageSpaceStyle,
        imageStyle,
        imageCaptionStyle,
        descriptionStyle,
    } = useAppLogoBlock();

    return (
        <Space orientation="vertical" style={generalSpaceStyle}>
            <Space orientation="horizontal" style={imageSpaceStyle} size="large">
                <Image
                    src="/logo-rounded.png"
                    style={imageStyle}
                    preview={false}
                    alt="Трамплин API Logo"
                />
                <Text style={imageCaptionStyle}>
                    Трамплин
                </Text>
            </Space>
            <Text style={descriptionStyle}>
                Платформа для поиска работы
            </Text>
        </Space>
    )
};

export default AppLogoBlock;
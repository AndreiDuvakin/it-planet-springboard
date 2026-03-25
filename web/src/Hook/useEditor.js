import { useMemo, useRef } from "react";
import { notification } from "antd";

const useEditor = () => {
    const editorRef = useRef(null);

    const joditConfig = useMemo(
        () => ({
            readonly: false,
            height: 600,
            toolbarAdaptive: false,
            buttons: [
                "bold", "italic", "underline", "strikethrough", "|",
                "superscript", "subscript", "|",
                "ul", "ol", "outdent", "indent", "|",
                "font", "fontsize", "brush", "paragraph", "|",
                "align", "hr", "|",
                "table", "link", "image", "video", "symbols", "|",
                "undo", "redo", "cut", "copy", "paste", "selectall", "eraser", "|",
                "find", "source", "fullsize", "print", "preview",
            ],
            autofocus: false,
            preserveSelection: true,
            askBeforePasteHTML: false,
            askBeforePasteFromWord: false,
            defaultActionOnPaste: "insert_clear_html",
            spellcheck: true,
            placeholder: "Начните писать здесь...",
            showCharsCounter: true,
            showWordsCounter: true,
            showXPathInStatusbar: false,
            toolbarSticky: true,
            toolbarButtonSize: "middle",
            cleanHTML: {
                removeEmptyElements: true,
                replaceNBSP: false,
            },
            uploader: {
                insertImageAsBase64URI: true,
                imagesExtensions: ['jpg', 'png', 'jpeg', 'gif', 'webp', 'svg'],
            },
            mediaBlocks: ['video', 'audio', 'iframe', 'embed'],
            controls: {
                paragraph: {
                    list: {
                        p: 'Обычный текст',
                        h1: 'Заголовок 1',
                        h2: 'Заголовок 2',
                        h3: 'Заголовок 3',
                        blockquote: 'Цитата',
                    }
                }
            },
            paste: {
                insertAsBase64: true,
                maxFileSize: 5 * 1024 * 1024,
                error: () => {
                    notification.error({
                        message: "Ошибка вставки",
                        description: "Файл слишком большой.",
                    });
                },
            },
        }),
        []
    );

    const getContent = () => {
        return editorRef.current?.value || "";
    };

    const setContent = (content) => {
        if (editorRef.current) {
            editorRef.current.value = content;
        }
    };

    return {
        editorRef,
        joditConfig,
        getContent,
        setContent
    };
};

export default useEditor;